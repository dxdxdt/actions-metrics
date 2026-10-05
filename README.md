# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-10-05T03:16:59.319027+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.586 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.231 | 18 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.563 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.185 | 5137 |
| us-east-2 | 0.196 | 1690 |
| us-gov-east-1 | 0.193 | 1933 |
| us-gov-west-1 | 0.175 | 237 |
| us-west-1 | 0.117 | 4157 |
| us-west-2 | 0.176 | 193 |

