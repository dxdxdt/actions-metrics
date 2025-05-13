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
Updated: 2025-05-13T10:14:40.928482+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.675 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.591 |  |
| ap-south-1 | 0.894 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.611 |  |
| ca-central-1 | 0.283 | 10 |
| eu-central-1 | 0.587 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.607 |  |
| eu-west-1 | 0.503 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.546 |  |
| me-south-1 | 0.927 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.229 | 1861 |
| us-east-2 | 0.215 | 425 |
| us-gov-east-1 | 0.210 | 545 |
| us-gov-west-1 | 0.137 | 1 |
| us-west-1 | 0.090 | 1292 |
| us-west-2 | 0.139 |  |

