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
Updated: 2025-06-30T22:13:04.229457+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.788 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.691 |  |
| ap-south-1 | 0.852 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.767 |  |
| ca-central-1 | 0.136 | 10 |
| eu-central-1 | 0.424 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.451 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.404 |  |
| me-south-1 | 0.764 |  |
| sa-east-1 | 0.529 |  |
| us-east-1 | 0.091 | 2323 |
| us-east-2 | 0.108 | 552 |
| us-gov-east-1 | 0.112 | 751 |
| us-gov-west-1 | 0.266 | 1 |
| us-west-1 | 0.224 | 1572 |
| us-west-2 | 0.268 |  |

