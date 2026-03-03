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
Updated: 2026-03-03T16:38:03.471288+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.531 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.453 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.858 |  |
| me-south-1 | 0.823 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.138 | 4212 |
| us-east-2 | 0.114 | 1395 |
| us-gov-east-1 | 0.116 | 1527 |
| us-gov-west-1 | 0.194 | 169 |
| us-west-1 | 0.192 | 3165 |
| us-west-2 | 0.193 | 137 |

