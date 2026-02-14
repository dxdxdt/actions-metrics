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
Updated: 2026-02-14T13:39:45.976120+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.663 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.135 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.808 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.115 | 4120 |
| us-east-2 | 0.096 | 1339 |
| us-gov-east-1 | 0.093 | 1464 |
| us-gov-west-1 | 0.210 | 147 |
| us-west-1 | 0.212 | 3059 |
| us-west-2 | 0.214 | 125 |

