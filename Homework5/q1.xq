<result>
  { 
      for $x in doc("mondial.xml")/mondial/country//city/name/text()
      return <c> { $x } </c>
  }
</result>