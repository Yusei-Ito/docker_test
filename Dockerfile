# まずビルド用イメージ
FROM gcc:12 AS builder
WORKDIR /src
RUN echo '#include <stdio.h>\nint main(){printf("Hello, World!\\n");return 0;}' > hello.c
RUN gcc hello.c -static -o hello

# 実行用は scratch（ベースなし）
FROM scratch
COPY --from=builder /src/hello /hello
CMD ["/hello"]
