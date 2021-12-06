
const getReplyList = async (bno) => {
    const response = await axios.get(`/replies1/list/${bno}`)
    return response.data
}

async function addReply(obj) {

    const response = await axios.post("/replies1",obj)
    return response.data

}

const removeReply = async (rno) => {

    const response = await axios.delete(`/replies1/${rno}`)
    return response.data
}

const modifyReply = async (reply) => {
    const response = await axios.put(`/replies1/${reply.rno}`,reply)
    return response.data
}