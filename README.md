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
Updated: 2026-08-12T16:48:55.356815+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.739 |  |
| ap-southeast-2 | 0.682 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.725 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.711 |  |
| ap-southeast-7 | 0.841 |  |
| ca-central-1 | 0.256 | 18 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.531 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.517 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.946 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.652 |  |
| us-east-1 | 0.205 | 4979 |
| us-east-2 | 0.215 | 1679 |
| us-gov-east-1 | 0.207 | 1822 |
| us-gov-west-1 | 0.157 | 222 |
| us-west-1 | 0.163 | 3931 |
| us-west-2 | 0.159 | 176 |

