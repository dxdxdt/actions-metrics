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
Updated: 2026-04-12T01:52:01.669970+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.709 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.690 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.725 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.196 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.505 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.145 | 4484 |
| us-east-2 | 0.158 | 1495 |
| us-gov-east-1 | 0.147 | 1642 |
| us-gov-west-1 | 0.216 | 192 |
| us-west-1 | 0.158 | 3397 |
| us-west-2 | 0.218 | 155 |

