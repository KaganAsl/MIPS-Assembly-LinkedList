# CENG311 HW2
## LinkedList with MIPS Assembly

**Explanation:**
"In this homework assignment, you will implement array of playlists with MIPS assembly language. 
Each playlist is a simple linked list, with each node’s data pointing to a song structure. You are 
expected to modify the source code provided with this homework."

### Operations:
1. Initialize array of playlist by using with an initial size of 3.
2. Create 3 playlists as linked list and insert them into array of playlist.
3. Resize to size of 5. Create 2 more playlists and insert them into available areas in array of playlist.
4. Create 4 songs for each playlist and insert them into playlists. Each song must have a name and duration.
5. Print all the songs.
6. Remove the second song of each playlist.
7. Print all the songs.
8. Add 1 more song to each playlist.
9. Print all the songs.
10. Remove the fourth playlist.
11. Print all the songs.
12. Search for given two songs, print the result.

### Rules:
- All variables has been declared. Therefore, you should not define any new variable.
- Structures of the array, linked list, and song is given.
- There is no freeing for MIPS, so you should not try to free the spaces you allocated.
- S registers are expected to remain unchanged after the subroutines are used.

### Structures:
<table>
    <thead>
        <tr>
            <th colspan="2">Array</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>4 Bytes - Address of the Data</td>
            <td>4 Bytes - Size</td>
        </tr>
    </tbody>
    <thead>
        <tr>
            <th colspan="2">Linked List Node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>4 Bytes - Address of the Data</td>
            <td>4 Bytes - Address of the Next Node</td>
        </tr>
    </tbody>
    <thead>
        <tr>
            <th colspan="2">Song</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>4 Bytes - Address of the Name <br> (name itself is 64 bytes)</td>
            <td>4 Bytes - Duration</td>
        </tr>
    </tbody>
</table>

### Subroutine Usages:
<table>
  <tr>
    <th>Subroutine Name</th>
    <th>Argument 1 <br> ($a0)</th>
    <th>Argument 2 <br> ($a0)</th>
    <th>Argument 3 <br> ($a0)</th>
    <th>Return Value <br> ($v0)</th>
  </tr>
  <tr>
    <th>Generic</th>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td style="text-align: center";>createArray</td>
    <td style="text-align: center";>Size of the <br> array</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>Address of the <br> array</td>
  </tr>
  <tr>
    <td style="text-align: center";>resizeArray</td>
    <td style="text-align: center";>Address of the <br> array</td>
    <td style="text-align: center";>Old Size</td>
    <td style="text-align: center";>New Size</td>
    <td style="text-align: center";>Address of the <br> array</td>
  </tr>
  <tr>
    <td style="text-align: center";>putElementToArray</td>
    <td style="text-align: center";>Address of the <br> array</td>
    <td style="text-align: center";>Index</td>
    <td style="text-align: center";>Address of the <br> element</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <td style="text-align: center";>removeElementFromArray</td>
    <td style="text-align: center";>Address of the <br> array</td>
    <td style="text-align: center";>Index</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <td style="text-align: center";>createLinkedList</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>Address of the <br> linked list</td>
  </tr>
  <tr>
    <td style="text-align: center";>putElementToLinkedList</td>
    <td style="text-align: center";>Address of the <br> linked list</td>
    <td style="text-align: center";>Address of the <br> element</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <td style="text-align: center";>removeElementFromTheLinkedList</td>
    <td style="text-align: center";>Address of the <br> linked list</td>
    <td style="text-align: center";>Index</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <td style="text-align: center";>traverseArray</td>
    <td style="text-align: center";>Address of the <br> function <br> (isSong, printSong)</td>
    <td style="text-align: center";>Address of the <br> array</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <td style="text-align: center";>traverseLinkedList</td>
    <td style="text-align: center";>Address of the <br> function <br> (isSong, printSong)</td>
    <td style="text-align: center";>Address of the <br> linked list</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <th>Non-Generic</th>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td style="text-align: center";>createSong</td>
    <td style="text-align: center";>Address of the <br> song name</td>
    <td style="text-align: center";>Duration of <br> the song</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>Address of the <br> song</td>
  </tr>
  <tr>
    <td style="text-align: center";>isSong</td>
    <td style="text-align: center";>Address of the <br> song</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
  <tr>
    <td style="text-align: center";>compareSong</td>
    <td style="text-align: center";>Address of the <br> first string</td>
    <td style="text-align: center";>Address of the <br> second string</td>
    <td style="text-align: center";>Comparison <br> size</td>
    <td style="text-align: center";>1 for found, <br> 0 for not found</td>
  </tr>
  <tr>
    <td style="text-align: center";>Address of the <br> song</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
    <td style="text-align: center";>-</td>
  </tr>
</table>