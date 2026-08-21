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
Updated: 2026-08-21T23:16:23.902532+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.669 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.595 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.242 | 18 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.578 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.910 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.206 | 5039 |
| us-east-2 | 0.204 | 1681 |
| us-gov-east-1 | 0.191 | 1867 |
| us-gov-west-1 | 0.157 | 225 |
| us-west-1 | 0.102 | 4016 |
| us-west-2 | 0.158 | 184 |

