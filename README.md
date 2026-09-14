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
Updated: 2026-09-14T08:23:19.351385+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.711 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.188 | 18 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.507 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.529 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.268 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.152 | 5098 |
| us-east-2 | 0.168 | 1686 |
| us-gov-east-1 | 0.130 | 1913 |
| us-gov-west-1 | 0.196 | 233 |
| us-west-1 | 0.137 | 4110 |
| us-west-2 | 0.197 | 192 |

