import http.server
import socketserver

PORT = 9443

class CustomHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b'server1 responding')
        else:
            super().do_GET()

with socketserver.TCPServer(("", PORT), CustomHandler) as httpd:
    print(f"serving at port {PORT}")
    httpd.serve_forever()

