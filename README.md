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
Updated: 2026-08-03T22:00:11.804103+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.634 |  |
| ap-east-2 | 0.575 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.769 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.664 |  |
| ap-southeast-7 | 0.815 |  |
| ca-central-1 | 0.268 | 17 |
| ca-west-1 | 0.164 |  |
| eu-central-1 | 0.552 |  |
| eu-central-2 | 0.573 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.519 |  |
| eu-west-3 | 0.534 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.668 |  |
| us-east-1 | 0.225 | 4936 |
| us-east-2 | 0.230 | 1673 |
| us-gov-east-1 | 0.193 | 1800 |
| us-gov-west-1 | 0.130 | 210 |
| us-west-1 | 0.126 | 3879 |
| us-west-2 | 0.131 | 172 |

