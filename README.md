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
Updated: 2026-03-12T11:27:55.617414+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.863 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.638 |  |
| ap-northeast-2 | 0.759 |  |
| ap-northeast-3 | 0.664 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.895 |  |
| ap-southeast-2 | 0.807 |  |
| ap-southeast-3 | 0.950 |  |
| ap-southeast-4 | 0.847 |  |
| ap-southeast-5 | 0.919 |  |
| ap-southeast-6 | 0.851 |  |
| ap-southeast-7 | 0.998 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.372 |  |
| eu-central-2 | 0.394 |  |
| eu-north-1 | 0.422 |  |
| eu-south-1 | 0.397 |  |
| eu-south-2 | 0.411 |  |
| eu-west-1 | 0.290 |  |
| eu-west-2 | 0.326 |  |
| eu-west-3 | 0.353 |  |
| il-central-1 | 0.537 |  |
| me-central-1 | 0.740 |  |
| me-south-1 | 0.710 |  |
| mx-central-1 | 0.269 |  |
| sa-east-1 | 0.476 |  |
| us-east-1 | 0.046 | 4266 |
| us-east-2 | 0.092 | 1419 |
| us-gov-east-1 | 0.089 | 1565 |
| us-gov-west-1 | 0.329 | 180 |
| us-west-1 | 0.267 | 3214 |
| us-west-2 | 0.349 | 144 |

