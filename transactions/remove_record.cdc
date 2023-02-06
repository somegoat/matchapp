import MatchApp from 0x01

transaction() {

  prepare(acct: AuthAccount) {
    log(MatchApp.generate(acc : acct.address))
    log(MatchApp.remove(acc: acct.address))
  }

  execute  {
    log(MatchApp.status())
    
  }
}