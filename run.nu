let iroha_git = 'https://github.com/hyperledger/iroha'
let iroha_git_rev = '7e338a5c762f7e0e25b79937e6215c10ae53b290' # current iroha2-dev
let cargo_root = './cargo-install'
let client_config_file = 'client_config.json'
let client_dir = './client'

def main [...args] {
    let cmd = $args.0

    if $cmd == 'install-client' {
        echo 'Installing iroha_client_cli'
        cargo install --git $iroha_git --rev $iroha_git_rev --root $cargo_root --debug iroha_client_cli
        cp $'($cargo_root)/bin/iroha_client_cli' ./client/cli
        cp $client_config_file $'./($client_dir)/config.json'
        echo 'Client installed'
    } else if $cmd == 'create-assets' {
        cd $client_dir

        let domain = 'wonderland'
        let value_type = 'Quantity'

        [rose knife black red eagle] | each { |it|
            let asset_id = $'($it)#($domain)'

            echo
            echo $"
            Creating asset: ($asset_id)
            "

            ./cli asset register --id $asset_id --value-type $value_type
            sleep 1.5sec
        }
    } else if $cmd == 'list-assets' {
        cd $client_dir
        ./iroha_client_cli asset list all
    }
}

