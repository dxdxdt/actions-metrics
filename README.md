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
Updated: 2026-07-18T14:17:48.168955+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.007 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.492 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.855 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.850 |  |
| ca-central-1 | 0.245 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.561 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.561 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.504 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.201 | 4879 |
| us-east-2 | 0.214 | 1657 |
| us-gov-east-1 | 0.191 | 1766 |
| us-gov-west-1 | 0.166 | 203 |
| us-west-1 | 0.158 | 3798 |
| us-west-2 | 0.165 | 167 |

