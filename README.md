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
Updated: 2026-08-13T20:33:21.727246+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.269 | 18 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.561 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.943 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.184 | 4988 |
| us-east-2 | 0.218 | 1679 |
| us-gov-east-1 | 0.226 | 1825 |
| us-gov-west-1 | 0.192 | 222 |
| us-west-1 | 0.131 | 3941 |
| us-west-2 | 0.193 | 176 |

