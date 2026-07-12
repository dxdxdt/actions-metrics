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
Updated: 2026-07-12T15:52:30.097279+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.777 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.955 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.458 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.087 | 4856 |
| us-east-2 | 0.106 | 1656 |
| us-gov-east-1 | 0.109 | 1740 |
| us-gov-west-1 | 0.272 | 202 |
| us-west-1 | 0.224 | 3772 |
| us-west-2 | 0.272 | 165 |

