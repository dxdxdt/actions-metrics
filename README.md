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
Updated: 2026-08-17T21:18:50.209362+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.779 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.182 | 18 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.118 | 5013 |
| us-east-2 | 0.141 | 1680 |
| us-gov-east-1 | 0.140 | 1840 |
| us-gov-west-1 | 0.284 | 224 |
| us-west-1 | 0.219 | 3981 |
| us-west-2 | 0.291 | 181 |

