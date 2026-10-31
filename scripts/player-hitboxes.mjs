export const playerBoxes = new Set(['h1','h2','h3','ts','ts1','b_cj','b_fk','b_fk3','b_gb1','b_gb2','b_gb3']);
class Bits {
  constructor(bytes,byte=0){this.bytes=bytes;this.bit=byte*8;}
  read(n,signed=false){let value=0;for(let i=0;i<n;i++){if(this.bit>=this.bytes.length*8)throw new Error('Invalid matrix');value=value*2+((this.bytes[this.bit>>3]>>(7-(this.bit&7)))&1);this.bit++;}return signed&&n&&value>=2**(n-1)?value-2**n:value;}
  get end(){return Math.ceil(this.bit/8);}
}
export function readMatrix(bytes,start){
  const r=new Bits(bytes,start);let sx=65536,sy=65536,rx=0,ry=0;
  if(r.read(1)){const n=r.read(5);sx=r.read(n,true);sy=r.read(n,true);}
  if(r.read(1)){const n=r.read(5);rx=r.read(n,true);ry=r.read(n,true);}
  const n=r.read(5),tx=r.read(n,true),ty=r.read(n,true);
  return {sx,sy,rx,ry,tx,ty,end:r.end};
}
function signedWidth(values){return Math.max(1,...values.map(v=>{for(let n=1;n<=31;n++)if(v>=-(2**(n-1))&&v<2**(n-1))return n;throw new Error('Matrix overflow');}));}
export function writeMatrix(m){
  const bits=[];const put=(v,n)=>{if(v<0)v+=2**n;for(let i=n-1;i>=0;i--)bits.push(Math.floor(v/2**i)%2);};
  put(1,1);let n=signedWidth([m.sx,m.sy]);put(n,5);put(m.sx,n);put(m.sy,n);
  const rotate=m.rx!==0||m.ry!==0;put(rotate?1:0,1);
  if(rotate){n=signedWidth([m.rx,m.ry]);put(n,5);put(m.rx,n);put(m.ry,n);}
  n=signedWidth([m.tx,m.ty]);put(n,5);put(m.tx,n);put(m.ty,n);
  const output=Buffer.alloc(Math.ceil(bits.length/8));bits.forEach((b,i)=>{output[i>>3]|=b<<(7-(i&7));});return output;
}
export function namedPlacement(data){
  const flags=data[0];if(!(flags&0x20)||!(flags&4))return null;
  let at=3;if(flags&2)at+=2;
  const start=at,matrix=readMatrix(data,at);at=matrix.end;
  if(flags&8){const r=new Bits(data,at);const add=r.read(1),mult=r.read(1),n=r.read(4);r.read(n*4*add);r.read(n*4*mult);at=r.end;}
  if(flags&16)at+=2;
  const end=data.indexOf(0,at);if(end<0)throw new Error('Invalid placement name');
  return {name:data.toString('utf8',at,end),matrix,start,end:matrix.end};
}
export function expandPlayerBox(data){
  const placement=namedPlacement(data);if(!placement||!playerBoxes.has(placement.name))return null;
  const before=placement.matrix;if(before.rx||before.ry)throw new Error('Unexpected rotated hitbox');
  const after={...before,sx:Math.round(before.sx*1.25),sy:Math.round(before.sy*1.15),
    tx:Math.round(before.tx+(before.sx/65536)*(-10)*(1-1.25))};
  return {data:Buffer.concat([data.subarray(0,placement.start),writeMatrix(after),data.subarray(placement.end)]),name:placement.name,before,after};
}
