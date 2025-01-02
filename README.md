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
Updated: 2025-01-02T10:12:02.265806

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.810 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.729 |  |
| ap-south-1 | 0.889 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.754 |  |
| ca-central-1 | 0.180 | 2 |
| eu-central-1 | 0.481 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.499 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.447 |  |
| me-south-1 | 0.819 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.122 | 571 |
| us-east-2 | 0.162 | 126 |
| us-gov-east-1 | 0.166 | 108 |
| us-gov-west-1 | 0.296 |  |
| us-west-1 | 0.221 | 330 |
| us-west-2 | 0.295 |  |

