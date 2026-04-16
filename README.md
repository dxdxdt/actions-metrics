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
Updated: 2026-04-16T06:53:43.166592+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.169 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.549 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.870 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.140 | 4509 |
| us-east-2 | 0.099 | 1504 |
| us-gov-east-1 | 0.103 | 1650 |
| us-gov-west-1 | 0.214 | 193 |
| us-west-1 | 0.163 | 3419 |
| us-west-2 | 0.214 | 156 |

