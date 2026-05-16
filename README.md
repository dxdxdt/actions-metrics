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
Updated: 2026-05-16T19:59:19.289011+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.957 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.864 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.125 | 4649 |
| us-east-2 | 0.110 | 1597 |
| us-gov-east-1 | 0.114 | 1694 |
| us-gov-west-1 | 0.231 | 195 |
| us-west-1 | 0.183 | 3569 |
| us-west-2 | 0.232 | 158 |

