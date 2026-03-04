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
Updated: 2026-03-04T15:33:23.815756+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.694 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.681 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.928 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.729 |  |
| ap-southeast-3 | 0.888 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.546 |  |
| us-east-1 | 0.111 | 4218 |
| us-east-2 | 0.133 | 1397 |
| us-gov-east-1 | 0.127 | 1529 |
| us-gov-west-1 | 0.248 | 170 |
| us-west-1 | 0.206 | 3171 |
| us-west-2 | 0.249 | 140 |

