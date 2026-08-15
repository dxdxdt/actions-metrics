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
Updated: 2026-08-15T00:45:31.803662+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.777 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.604 |  |
| ap-northeast-2 | 0.713 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.134 | 18 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.565 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.080 | 4998 |
| us-east-2 | 0.097 | 1679 |
| us-gov-east-1 | 0.102 | 1828 |
| us-gov-west-1 | 0.276 | 222 |
| us-west-1 | 0.225 | 3949 |
| us-west-2 | 0.282 | 177 |

