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
Updated: 2025-10-28T22:12:29.661131+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.761 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.681 |  |
| ap-south-1 | 0.871 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.715 |  |
| ca-central-1 | 0.176 | 15 |
| eu-central-1 | 0.466 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.481 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.444 |  |
| me-south-1 | 0.788 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.130 | 3376 |
| us-east-2 | 0.136 | 987 |
| us-gov-east-1 | 0.141 | 1123 |
| us-gov-west-1 | 0.233 | 68 |
| us-west-1 | 0.191 | 2313 |
| us-west-2 | 0.233 | 22 |

