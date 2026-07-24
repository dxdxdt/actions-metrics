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
Updated: 2026-07-24T12:14:44.062363+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.562 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.473 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.201 | 4903 |
| us-east-2 | 0.163 | 1661 |
| us-gov-east-1 | 0.184 | 1777 |
| us-gov-west-1 | 0.198 | 206 |
| us-west-1 | 0.115 | 3827 |
| us-west-2 | 0.196 | 170 |

