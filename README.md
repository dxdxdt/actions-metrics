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
Updated: 2026-03-16T10:51:29.746419+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.517 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.472 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.851 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.171 | 4288 |
| us-east-2 | 0.167 | 1429 |
| us-gov-east-1 | 0.170 | 1577 |
| us-gov-west-1 | 0.178 | 185 |
| us-west-1 | 0.147 | 3241 |
| us-west-2 | 0.179 | 148 |

