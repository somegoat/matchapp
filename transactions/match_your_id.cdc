import MatchApp from 0x01

transaction() {

  prepare(acct: AuthAccount) {
    log(MatchApp.match(acc : acct.address))
  }

  execute  {
    log("Were you really liking your odds?")
    
  }
}
