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
Updated: 2026-03-24T11:40:28.125056+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.817 |  |
| ap-east-2 | 0.758 |  |
| ap-northeast-1 | 0.639 |  |
| ap-northeast-2 | 0.759 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.949 |  |
| ap-southeast-4 | 0.861 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.845 |  |
| ap-southeast-7 | 0.993 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.371 |  |
| eu-central-2 | 0.386 |  |
| eu-north-1 | 0.424 |  |
| eu-south-1 | 0.396 |  |
| eu-south-2 | 0.408 |  |
| eu-west-1 | 0.292 |  |
| eu-west-2 | 0.323 |  |
| eu-west-3 | 0.354 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.742 |  |
| me-south-1 | 0.698 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.473 |  |
| us-east-1 | 0.041 | 4349 |
| us-east-2 | 0.087 | 1449 |
| us-gov-east-1 | 0.085 | 1600 |
| us-gov-west-1 | 0.323 | 190 |
| us-west-1 | 0.276 | 3289 |
| us-west-2 | 0.328 | 151 |

