async function doA() {

  console.log("doA.................")

  const response = await axios.get("/replies")
  const data = response.data
  console.log("doA..data", data)
  return data
}

const doB = (fn) => {
  console.log("doB................")
  try {
    axios.get('/replies').then(response => {
      console.log(response)
      const arr = response.data
      fn(arr)
    })
  } catch (error) {
    console.log(err)
  }
}

async function doC(obj) {

  const response = await axios.post("/replies", obj)
  return response.data

}

const doD = async (frno) => {
  const response = await axios.delete(`/replies/${frno}`)
  return response.data
}

const doE = async (freply) => {

  const response = await axios.put(`/replies/${freply.frno}`, freply)

  return response.data
}

const getReplyList = async (fno) => {
  const response = await axios.get(`/replies/list/${fno}`)
  return response.data
}

async function addReply(obj) {

  const response = await axios.post("/replies", obj)
  return response.data

}

const removeReply = async (frno) => {

  const response = await axios.delete(`/replies/${frno}`)
  return response.data
}

const modifyReply = async (freply) => {
  const response = await axios.put(`/replies/${freply.frno}`, freply)
  return response.data
}