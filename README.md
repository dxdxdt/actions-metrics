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
Updated: 2026-04-06T23:29:10.771772+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.533 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.577 |  |
| us-east-1 | 0.145 | 4451 |
| us-east-2 | 0.152 | 1487 |
| us-gov-east-1 | 0.150 | 1631 |
| us-gov-west-1 | 0.228 | 191 |
| us-west-1 | 0.171 | 3366 |
| us-west-2 | 0.222 | 154 |

