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
Updated: 2026-02-04T01:17:57.818908+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.800 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.713 |  |
| ap-south-1 | 0.917 |  |
| ap-southeast-1 | 0.862 |  |
| ap-southeast-2 | 0.744 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.434 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.472 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.412 |  |
| me-south-1 | 0.789 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.087 | 4056 |
| us-east-2 | 0.100 | 1314 |
| us-gov-east-1 | 0.100 | 1427 |
| us-gov-west-1 | 0.278 | 134 |
| us-west-1 | 0.238 | 2989 |
| us-west-2 | 0.251 | 124 |

