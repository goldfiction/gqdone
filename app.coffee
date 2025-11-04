_from=null
_emailit=null
_setServer=null
gqemail=null

useESModule=(done)->
  _from = await import('./user.js')
  _from = _from._from
  gqemail = await import('gqemail')
  _emailit = gqemail._emailit
  _setServer = gqemail._setServer
  done()

done=(msg,cb)->
  useESModule ()->
    sendmail = ()->
      _setServer _from
      _address =
        from: _from.user
        to: _from.to
        title: _from.title||"Notice: a job has been done right now"
        text: msg

      #console.log _address
      _emailit _address
      #console.log "Email sent."
      if cb
        cb()
        return
      return
    sendmail()
@done=done

@abc="abc"