# Simple Brownie or Web3.py deployment snippet
def deploy_factory():
    admin = accounts.load('deployer_account')
    factory = IDOFactory.deploy({'from': admin})
    print(f"Factory deployed at: {factory.address}")
