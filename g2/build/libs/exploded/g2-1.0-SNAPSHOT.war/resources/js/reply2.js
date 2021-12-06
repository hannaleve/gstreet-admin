async function doA() {
    console.log("doA..................")
    const response = await axios.get("/replies2/") //배열에 있는거 가져옴
    const data = response.data
    console.log("doA:data", data)
    return data
}

const doB = (fn) => {
    console.log("doB................")
    try {
        axios.get('/replies2').then(response => {
            console.log(response)
            const arr = response.data
            fn(arr)
        })
    } catch (error) {
        console.log(err)
    }
}

async function doC(obj) {
    const response = await axios.post("/replies2/", obj)
//언제올지 모르니까 promise을 준다.
    return response.data
}

const doD = async (rno) => { //특정한게시물삭제
    const response = await axios.delete(`/replies2/${rno}`) //백틱으로 처리
    return response.data
}

const doE = async (reply) => {
    const response = await axios.put(`/replies2/${reply.rno}`, reply)
    return response.date
}

console.log("reply module...............");

var replyService = (function (){
    return {name:"AAAA"};
})();

const getReplyList = async (sno) => {
    const response = await axios.get(`/replies2/list/${sno}`)
    return response.data
}

async function addReply(obj) {

    const response = await axios.post("/replies2",obj)
    return response.data

}

const removeReply = async (rno) => {

    const response = await axios.delete(`/replies2/${rno}`)
    return response.data
}

const modifyReply = async (reply) => {
    const response = await axios.put(`/replies2/${reply.rno}`,reply)
    return response.data
}