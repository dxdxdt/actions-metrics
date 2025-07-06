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
Updated: 2025-07-06T01:09:40.796834+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.758 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.666 |  |
| ap-south-1 | 0.883 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.714 |  |
| ca-central-1 | 0.159 | 11 |
| eu-central-1 | 0.479 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.492 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.448 |  |
| me-south-1 | 0.821 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.123 | 2369 |
| us-east-2 | 0.117 | 572 |
| us-gov-east-1 | 0.117 | 761 |
| us-gov-west-1 | 0.222 | 1 |
| us-west-1 | 0.206 | 1607 |
| us-west-2 | 0.224 |  |

