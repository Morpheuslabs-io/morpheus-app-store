module.exports = {
      networks: {
              development: {
                        host: "tesrpc",
                        port: 8545,
                        network_id: "*" // Match any network id
                      },
              main: {
                        host: "MORPHEUSNODE1", // Connect to geth on the specified
                        port: 8545,
                        from: "0x0000000000000000000000000000000000000000", // change for default address used for deployment
                        network_id: 1,
                        gasPrice: 3000000000, // Be careful, this is in Shannon
                        gas: 2000000
                      },
              kovan: {
                        host: "localhost", // Connect to geth on the specified
                        port: 8545,
                        from: "0x0000000000000000000000000000000000000000", // change for default address used for deployment
                        network_id: 42,
                        gas: 2000000, // Gas limit used for deploys
                        gasPrice: 3000000000
                     },
	      ropsten: {
                        host: "localhost", // Connect to geth on the specified
                        port: 8545,
                        from: "0x0000000000000000000000000000000000000000", // change for default address used for deployment
                        network_id: 3,
                        gas: 2000000, // Gas limit used for deploys
                        gasPrice: 20000000000
                      }
             }
};
