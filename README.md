# iroha-issue-assets-creation

## Steps

You need Rust 1.60 and `docker-compose` installed.

Also please install [Nushell](https://www.nushell.sh/book/installation.html#pre-built-binaries) to run the helper script:

```bash
cargo install nu
```

Then:

1. Install `iroha_client_cli`:

    ```bash
    nu run.nu install-client
    ```

2. Startup Iroha peers:

    ```bash
    docker-compose up
    ```

3. Create assets:

    ```bash
    nu run.nu create-assets
    ```

4. List assets:

   ```bash
   nu run.nu list-assets
   ```

### Expected output

Expected to see all of the created assets

### Actual output

```js
[
    Asset {
        id: Id {
            definition_id: DefinitionId {
                name: "rose",
                domain_id: Id {
                    name: "wonderland",
                },
            },
            account_id: Id {
                name: "alice",
                domain_id: Id {
                    name: "wonderland",
                },
            },
        },
        value: Quantity(
            13,
        ),
    },
]
```
