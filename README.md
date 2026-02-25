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
Updated: 2026-02-25T18:02:46.950132+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.721 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.229 | 16 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.856 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.165 | 4183 |
| us-east-2 | 0.170 | 1379 |
| us-gov-east-1 | 0.168 | 1509 |
| us-gov-west-1 | 0.207 | 161 |
| us-west-1 | 0.155 | 3118 |
| us-west-2 | 0.206 | 131 |

