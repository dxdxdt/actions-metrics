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
Updated: 2026-05-04T02:05:49.791921+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.505 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.453 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.189 |  |
| sa-east-1 | 0.589 |  |
| us-east-1 | 0.146 | 4591 |
| us-east-2 | 0.108 | 1565 |
| us-gov-east-1 | 0.115 | 1671 |
| us-gov-west-1 | 0.198 | 194 |
| us-west-1 | 0.156 | 3529 |
| us-west-2 | 0.207 | 157 |

