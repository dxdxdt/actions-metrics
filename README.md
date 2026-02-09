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
Updated: 2026-02-09T17:44:35.291965+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.639 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.567 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.599 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.641 |  |
| ca-central-1 | 0.284 | 16 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.599 |  |
| eu-north-1 | 0.632 |  |
| eu-south-1 | 0.617 |  |
| eu-south-2 | 0.622 |  |
| eu-west-1 | 0.508 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.559 |  |
| il-central-1 | 0.788 |  |
| me-central-1 | 0.970 |  |
| me-south-1 | 0.930 |  |
| sa-east-1 | 0.683 |  |
| us-east-1 | 0.245 | 4093 |
| us-east-2 | 0.223 | 1326 |
| us-gov-east-1 | 0.218 | 1446 |
| us-gov-west-1 | 0.124 | 141 |
| us-west-1 | 0.076 | 3029 |
| us-west-2 | 0.131 | 125 |

