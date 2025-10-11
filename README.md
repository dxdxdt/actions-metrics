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
Updated: 2025-10-11T10:11:48.341415+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.794 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.703 |  |
| ap-south-1 | 0.923 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.760 |  |
| ca-central-1 | 0.112 | 15 |
| eu-central-1 | 0.430 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.443 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.400 |  |
| me-south-1 | 0.734 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.081 | 3267 |
| us-east-2 | 0.082 | 889 |
| us-gov-east-1 | 0.083 | 1070 |
| us-gov-west-1 | 0.257 | 50 |
| us-west-1 | 0.246 | 2195 |
| us-west-2 | 0.268 | 20 |

