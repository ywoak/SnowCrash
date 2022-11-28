#echo server program
import socket

HOST = '0.0.0.0'
PORT = 6969
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)

while 1:
        conn, addr = s.accept()
        print 'Connected by', addr
        while 1:
                data = conn.recv(200)
                if not data: break
                print(data)
                if len(data) > 12: exit()
