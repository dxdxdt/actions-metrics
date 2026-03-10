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
Updated: 2026-03-10T06:39:24.937060+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.507 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.167 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.456 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.855 |  |
| mx-central-1 | 0.276 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.168 | 4252 |
| us-east-2 | 0.163 | 1413 |
| us-gov-east-1 | 0.162 | 1550 |
| us-gov-west-1 | 0.174 | 177 |
| us-west-1 | 0.185 | 3205 |
| us-west-2 | 0.175 | 144 |

