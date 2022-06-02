let iroha_git = 'https://github.com/hyperledger/iroha'
let iroha_git_rev = 'efa9a35692a949707ae0752119e4c4a1a08342a1' # current iroha2-dev
let cargo_root = './cargo-install'
let client_config_file = './configs/client_cli/config.json'
let client_dir = './client'

def main [...args] {
    let cmd = $args.0

    if $cmd == 'install-client' {
        echo 'Installing iroha_client_cli'
        cargo install --git $iroha_git --rev $iroha_git_rev --root $cargo_root --debug iroha_client_cli
        mkdir client
        cp $'($cargo_root)/bin/iroha_client_cli' ./client/
        cp $client_config_file $'./($client_dir)/'
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

            ./iroha_client_cli asset register --id $asset_id --value-type $value_type
            sleep 1.5sec
        }
    } else if $cmd == 'list-assets' {
        cd $client_dir
        ./iroha_client_cli asset list all
    }
}

