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
Updated: 2026-07-07T10:48:40.490339+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.604 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.848 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.565 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.940 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.205 | 4829 |
| us-east-2 | 0.205 | 1655 |
| us-gov-east-1 | 0.201 | 1729 |
| us-gov-west-1 | 0.162 | 201 |
| us-west-1 | 0.105 | 3753 |
| us-west-2 | 0.162 | 164 |

