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
Updated: 2026-04-25T09:44:36.183539+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.595 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.650 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.251 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.539 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.551 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.501 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.910 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.192 | 4560 |
| us-east-2 | 0.193 | 1528 |
| us-gov-east-1 | 0.177 | 1663 |
| us-gov-west-1 | 0.175 | 194 |
| us-west-1 | 0.115 | 3476 |
| us-west-2 | 0.173 | 157 |

