# Troubleshooting

### If `asdf` is upgraded, ASDF_DIR may be incorrect

    ```shell
    printf "'%s'\n" "$ASDF_DIR"
    unset ASDF_DIR
    ```
