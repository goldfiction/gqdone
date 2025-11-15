_from=null
_emailit=null
_setServer=null
gqemail=null

useESModule=(done)->
  try
    _from = await import(process.cwd() + '/user.js')
    _from = _from._from
  catch e
    #console.log e
    null
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
        title: _from.title||"Notice: a job has been done"
        text: msg

      #console.log _address
      _emailit _address
      #console.log "Email sent."
      if cb
        cb()
    try
      sendmail()
    catch e
      cb e
@done=done

@abc="abc"