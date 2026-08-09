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
Updated: 2026-08-09T22:21:56.449187+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.977 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.741 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.146 | 18 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.589 |  |
| us-east-1 | 0.112 | 4964 |
| us-east-2 | 0.117 | 1678 |
| us-gov-east-1 | 0.099 | 1814 |
| us-gov-west-1 | 0.231 | 214 |
| us-west-1 | 0.176 | 3915 |
| us-west-2 | 0.232 | 175 |

